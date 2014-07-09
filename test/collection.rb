# coding: utf-8

$LOAD_PATH.push('./lib')
require 'voice_text'
require 'fileutils'

FileUtils.mkdir('voices') unless File.exist?('voices')

api_key = ENV['VOICE_TEXT_API_KEY']
vt = VoiceText.new(api_key)

text = '我々は一人の英雄を失った。しかし、これは敗北を意味するのか？否！始まりなのだ！ '

VoiceText::SPEAKERS.each do |speaker|
  emotions = [nil] + VoiceText::EMOTIONS
  emotions.each do |emotion|
    [50, 100, 200].each do |pitch|
      begin
        puts "#{text}, speaker:#{speaker}, emotion:#{emotion}, pitch:#{pitch}"
        file = vt.text_to_speech(text, speaker: speaker, emotion: emotion, pitch: pitch)
        FileUtils.move(file, "./voices/voice_#{speaker}_#{emotion}_#{pitch}.wav")
      rescue => e
        puts e.message
      end
    end
  end
end
