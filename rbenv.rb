script_dir =  File.expand_path(File.dirname(__FILE__))
# 必要な変数をnodeに読み込む
node.reverse_merge!(YAML.load_file("#{script_dir}/vars/rbenv.yml"))
node.reverse_merge!(YAML.load_file("#{script_dir}/vars/common.yml"))

include_recipe "#{script_dir}/cookbook/rbenv.rb"
