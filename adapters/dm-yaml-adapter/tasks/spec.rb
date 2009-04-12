begin
  gem 'rspec', '~>1.2.2'
  require 'spec'
  require 'spec/rake/spectask'

  task :default => [ :spec ]

  desc 'Run specifications'
  Spec::Rake::SpecTask.new(:spec) do |t|
    t.spec_opts << '--options' << 'spec/spec.opts' if File.exists?('spec/spec.opts')
    t.spec_files = Pathname.glob((ROOT + 'spec/**/*_spec.rb').to_s).map { |f| f.to_s }
  end

  begin
    Spec::Rake::SpecTask.new(:rcov) do |t|
        gem 'rcov', '~>0.8'
        t.spec_opts << '--options' << 'spec/spec.opts' if File.exists?('spec/spec.opts')
        t.spec_files = Pathname.glob((ROOT + 'spec/**/*_spec.rb').to_s).map { |f| f.to_s }
        t.rcov = true
        t.rcov_opts = ['--exclude', 'spec']
    end
  rescue LoadError
    # rcov not installed
  end
rescue LoadError
  # rspec not installed
end
