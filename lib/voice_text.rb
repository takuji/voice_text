# coding: utf-8
require 'net/http'
require 'openssl'
require 'tempfile'
require 'voice_text/version'

class VoiceText
  DEFAULT_OPTIONS = {
    speaker: :show,
    emotion: nil,
    emotion_level: nil,
    pitch: 100,
    speed: 100,
    volume: 100
  }

  SPEAKERS = [:show, :haruka, :hikari, :takeru]
  EMOTIONS = [:happiness, :anger, :sadness]

  module Speakers
    SHOW   = :show
    HARUKA = :haruka
    HIKARI = :hikari
    TAKERU = :takeru
  end

  module Emotions
    HAPINESS = :happiness
    ANGER    = :anger
    SADNESS  = :sadness
  end

  def initialize(api_key)
    @api_key = api_key
  end

  def text_to_speech(text, options)
    params = DEFAULT_OPTIONS.merge(options).select{|k,v| v != nil}
    params[:text] = text
    if params[:speaker] == :show && params[:emotion]
      raise "Cannot specify the emotion parameter for 'show' voice"
    end
    download(params)
  end

  def download(params)
    uri = URI("https://api.voicetext.jp/v1/tts")
    req = Net::HTTP::Post.new(uri.request_uri)
    req.basic_auth @api_key, ''
    req.set_form_data params
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
