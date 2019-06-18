require 'json'

json = `xcrun simctl list devices -j`

# puts json

result = JSON.parse(json)

# インストール済みのシュミレータのデバイス一覧を取得
puts result["devices"]["iOS 11.3"]

result["devices"]["iOS 11.3"].each_with_index { | item, index |
  puts "#{ index }: #{ item["name"] }  #{ item["udid"] }"
  `open -a Simulator --args -CurrentDeviceUDID #{item["udid"]}`
}

