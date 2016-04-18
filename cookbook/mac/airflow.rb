install_list = %w(airflow airflow[mysql] airflow[celery])
install_list.each do |name|
  execute "install #{name}" do
    command "/usr/local/bin/pip install #{name}"
  end
end

execute 'write PATH' do
  command 'echo "export AIRFLOW_HOME=~/airflow" >> ~/.bashrc'
  not_if 'cat ~/.bashrc | grep "export AIRFLOW_HOME=~/airflow"'
end
