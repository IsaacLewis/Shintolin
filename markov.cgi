#!/usr/bin/ruby
print "Content-type: text/html\r\n\r\n"
require 'cgi'
require 'cgi/session'
load 'functions.rb'
$cgi = CGI.new
user_id = get_validated_id

class Markov
  def initialize(source)
    source = source.split(' ')
    @hash = {}
    source.each_with_index do
      |word, i|
      if @hash[word]
        @hash[word] << source[i + 1] 
      else
        @hash[word] = [source[i + 1]]
      end
    end
  end

  def chain(n=20)
    last_word = @hash.keys.rand_select
    text = last_word
    (n - 1).times do
      new_word = @hash[last_word].rand_select
      new_word = @hash.keys.rand_select unless new_word
      text += ' ' + new_word
      last_word = new_word
    end
    text
  end
end

class Array
  def rand_select
    self[rand(self.length)]
  end
end

if user_id == $cgi['id']
  result = mysql_select('messages',
                        {'speaker_id'=>$cgi['id'],
                          'type'=>['chat','talk','whisper','shout']})
else
  result = mysql_select('messages',
                        {'speaker_id'=>$cgi['id'],
                          'type'=>'chat'})
end

str = ''
result.each_hash {|row| str += ' ' + row['message']}
markov = Markov.new str
5.times {puts '<p>' + markov.chain(50) + '</p>'}
