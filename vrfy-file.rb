require 'socket'

#change hostname to the ip you want to test
hostname = '127.0.0.1'
port = 25

if ARGV.length !=1
        puts "Usage: vrfy.rb <text file>"
        exit
end


s = TCPSocket.new(hostname, port)
banner = s.recv(1024)
print banner

File.open(ARGV[0]) do |f|
	f.each_line do |line|
	puts line
		s.print("VRFY " + line)
		results = s.recv(1024)
		print results
	end
end
s.close
exit
