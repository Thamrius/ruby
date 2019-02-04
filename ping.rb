#!/usr/bin/env ruby

finished = []
ips = []
range = 1..254

range.each do |i|
  #update ip to fit the range you are scanning
  ip_address = "127.0.0.#{i}"
  Thread.new do
    `ping -q -c1 -W1 #{ip_address}`.split(/\n+/)[2].split(/,\s*/)[1].to_i > 0 and ips << ip_address
    finished << i
  end
end

until finished.count == range.count
  print "\r%#{(finished.count/range.count.to_f * 100).round}"
  sleep 0.1
end

print "\r          \r"
puts ips.sort_by! {|ip| ip.split('.').map{|octet| octet.to_i}}
