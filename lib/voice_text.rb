# coding: utf-8
require 'net/http'
require 'openssl'
require 'tempfile'
require 'voice_text/version'

class VoiceText
  def initialize(api_key)
    @api_key = api_key
  end

  def download(options)
    options[:text] = 'こんにちは' unless options[:text]
    options[:sperker] = 'show'  unless options[:speaker]
    # @options = {
    #   text: options[text] || 'お前はもう死んでいる',
    #   speaker: options[:speaker] || 'show'
    #   emotion: options[:emotion],
    #   emotion_level: options[:emotion_level],
    #   pitch: options[:pitch] || 100,
    #   speed: options[:speed] || 100,
    #   volume: options[:volume] || 100
    # }
    uri = URI("https://api.voicetext.jp/v1/tts")
    req = Net::HTTP::Post.new(uri.request_uri)
    req.basic_auth @api_key, ''
    req.set_form_data options
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    http.start do |h|
      res = h.request(req)
      if res.code == '200'
        save_response(res)
      else
        raise res
      end
    end
  end

  private

  def save_response(res)
    temp_file = Tempfile.new('voice_text')
    temp_file.write(res.body)
    temp_file.close
    temp_file
  end

end
