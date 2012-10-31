namespace :pl do
  task :load_extras do
    begin
      @build_data = YAML.load_file("#{ENV['HOME']}/.packaging/#{@builder_data_file}")
      @rpm_build_host = @build_data['rpm_build_host'] if @build_data['rpm_build_host']
      @deb_build_host = @build_data['deb_build_host'] if @build_data['deb_build_host']
      @osx_build_host = @build_data['osx_build_host'] if @build_data['osx_build_host']
      @tarball_path   = @build_data['tarball_path']   if @build_data['tarball_path']
      @dmg_path       = @build_data['dmg_path']       if @build_data['dmg_path']
      @pe_version     = @build_data['pe_version']     if @build_data['pe_version']
      @team           = @build_data['team']           if @build_data['team']
      @yum_repo_path  = @build_data['yum_repo_path']  if @build_data['yum_repo_path']
      @apt_repo_path  = @build_data['apt_repo_path']  if @build_data['apt_repo_path']
      @freight_conf   = @build_data['freight_conf']   if @build_data['freight_conf']
    rescue
      STDERR.puts "There was an error loading the builder data from #{ENV['HOME']}/.packaging/#{@builder_data_file}. Maybe try rake pl:fetch?"
      exit 1
    end
  end
end

