execute "brew install python" do
  command 'brew install python'
  not_if "brew list | grep -qi python"
end

execute 'switch python2.7' do
  command 'brew switch python 2.7.11'
end
