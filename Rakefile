desc 'backup rcfiles'
task :backup do
  timestamp = Time.now.strftime('%Y%m%d%H%M%S')
  each_entry do |_src_file, dst_file|
    if File.exist?(dst_file) && !File.lstat(dst_file).symlink?
      puts "Backing up #{dst_file}" if ENV['VERBOSE']
      File.rename(dst_file, dst_file + '.' + timestamp)
    end
  end
end

desc 'remove links'
task :remove do
  each_entry do |_src_file, dst_file|
    if File.symlink?(dst_file)
      puts "Unlinking #{dst_file}" if ENV['VERBOSE']
      File.unlink(dst_file)
    end
  end
end

desc 'install all the rcfiles into home'
task install: [:backup, :remove] do
  each_entry do |src_file, dst_file|
    puts "Creating symlink from #{dst_file} to #{src_file}" if ENV['VERBOSE']
    File.symlink(File.expand_path(src_file), dst_file)
  end
end

desc 'symlink nvim config'
task :nvim_symlink do
  system 'mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}'
  system 'ln -s ~/.vim ${XDG_CONFIG_HOME:=$HOME/.config}/nvim'
  system 'ln -s ~/.vimrc ${XDG_CONFIG_HOME:=$HOME/.config}/nvim/init.vim'
end

def each_entry
  Dir.foreach(File.dirname(__FILE__)) do |file|
    yield file, File.join(ENV['HOME'], '.' + file) unless file =~ /^\.|Rakefile/
  end
end
