cmd_list = [
  'curl -k --create-dirs -o ~/.embulk/bin/embulk -L "https://dl.embulk.org/embulk-latest.jar"',
  'chmod +x ~/.embulk/bin/embulk',
  'echo \'export PATH="$HOME/.embulk/bin:$PATH"\' >> ~/.bashrc',
  'source ~/.bashrc'  
]

cmd_list.each do |cmd|
  execute "execute #{cmd}" do
    command cmd
    not_if 'cat ~/.bashrc | grep "export PATH="$HOME/.embulk/bin:$PATH"'
  end
end
