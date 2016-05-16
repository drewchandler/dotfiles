desc "backup rcfiles"
task :backup do
  each_entry do |src_file, dst_file|
    if File.exists?(dst_file) && !File.lstat(dst_file).symlink?
      puts "Backing up #{dst_file}" if ENV['VERBOSE']
      File.rename(dst_file, dst_file + '.' + Time.now.strftime('%Y%m%d%H%M%S'))
    end
  end
end

desc "remove links"
task :remove do
  each_entry do |src_file, dst_file|
    if File.symlink?(dst_file)
      puts "Unlinking #{dst_file}" if ENV['VERBOSE']
      File.unlink(dst_file)
    end
  end
end

desc "install all the rcfile into home"
task :install => [:backup, :remove] do
  each_entry do |src_file, dst_file|
    puts "Creating symlink from #{dst_file} to #{src_file}" if ENV['VERBOSE']
    File.symlink(File.expand_path(src_file), dst_file)
  end
end

desc "update vim plugins"
task :vim_update do
  bundle_dir = File.join(File.dirname(__FILE__), 'vim/bundle')

  Dir.foreach(bundle_dir) do |entry|
    next if entry.match('^\.')

    path = File.join(bundle_dir, entry)
    next unless File.directory?(path)

    Dir.chdir path do
      system 'git pull'
    end
  end
end

desc "symlink nvim config"
task :nvim_symlink do
  system 'mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}'
  system 'ln -s ~/.vim ${XDG_CONFIG_HOME:=$HOME/.config}/nvim'
  system 'ln -s ~/.vimrc ${XDG_CONFIG_HOME:=$HOME/.config}/nvim/init.vim'
end

def each_entry(&blk)
  Dir.foreach(File.dirname(__FILE__)) do |file|
    yield file, File.join(ENV['HOME'], '.' + file) unless file =~ /^\.|Rakefile/
  end
end
