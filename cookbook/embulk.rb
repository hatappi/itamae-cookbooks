cmd_list = [
  'curl -k --create-dirs -o ~/.embulk/bin/embulk -L "https://dl.embulk.org/embulk-latest.jar"',
  'chmod +x ~/.embulk/bin/embulk',
  'echo \'export PATH="$HOME/.embulk/bin:$PATH"\' >> ~/.bashrc',
  'source ~/.bashrc'  
]

cmd_list.each do |cmd|
  execute "execute #{cmd}" do
    command cmd
    user node[:user]
    only_if "embulk | grep -qi 'command not found'"
  end
end


gem_list = [
  'embulk-input-mysql',
  'embulk-output-elasticsearch'
]

gem_list.each do |g|
  execute "embulk gem install #{g}" do
    command "source ~/.bashrc && embulk gem install #{g}"
    user node[:user]
  end
end
