# create a dataset from the items table

[
 "arora",
 "chrome",
 "chromium",
 "curl",
 "dillo",
 "elinks",
 "epiphany",
 "firefox",
 "iceweasel",
 "iexplore",
 "lynx",
 "microsoftedge",
 "midori",
 "nc",
 "netcat",
 "netsurf",
 "opera",
 "safari",
 "w3m",
 "wget",
].each do |name|
  Browser.find_or_create(:name => name)
end

[
 "linux",
 "linux (32-bit)",
 "linux (64-bit)",
 "macosx",
 "macosx (32-bit)",
 "macosx (64-bit)",
 "macosx 10.10 (32-bit)",
 "macosx 10.10 (64-bit)",
 "macosx 10.11 (32-bit)",
 "macosx 10.11 (64-bit)",
 "macosx 10.6 (32-bit)",
 "macosx 10.6 (64-bit)",
 "macosx 10.7 (32-bit)",
 "macosx 10.7 (64-bit)",
 "macosx 10.8 (32-bit)",
 "macosx 10.8 (64-bit)",
 "macosx 10.9 (32-bit)",
 "macosx 10.9 (64-bit)",
 "windows",
 "windows (32-bit)",
 "windows (64-bit)",
 "windows 10 (32-bit)",
 "windows 10 (64-bit)",
 "windows 7 (32-bit)",
 "windows 7 (64-bit)",
 "windows 8 (32-bit)",
 "windows 8 (64-bit)",
 "windows 8.1 (32-bit)",
 "windows 8.1 (64-bit)",
 "windows vista (32-bit)",
 "windows vista (64-bit)",
 "windows xp (32-bit)",
 "windows xp (64-bit)",
].each do |name|
  System.find_or_create(:name => name)
end

[
 "0.36.0",
 "0.36.1",
 "0.37.0"
].each do |name|
  Release.find_or_create(:name => name)
end

[ "Jon" ].each do |name|
  User.find_or_create(:name => name)
end
