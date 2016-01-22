require 'spec_helper'

describe 'the_silver_searcher::default' do
  context 'on ubuntu 14.04' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(:platform => 'ubuntu', :version => '14.04')
      runner.converge(described_recipe)
    end

    %w(automake pkg-config zlib1g-dev libpcre3-dev liblzma-dev tar).each do |p|
      it "installs #{p}" do
        expect(chef_run).to install_package(p)
      end
    end
  end

  context 'on centos 7.0' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(:platform => 'centos', :version => '7.0')
      runner.converge(described_recipe)
    end

    %w(automake pkgconfig zlib zlib-devel pcre pcre-devel xz xz-devel tar).each do |p|
      it "installs #{p}" do
        expect(chef_run).to install_package(p)
      end
    end
  end

  context 'on unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'downloads and compiles the_silver_searcher' do
      version = chef_run.node.the_silver_searcher.version
      cache_file = "#{Chef::Config['file_cache_path']}/the_silver_searcher-#{version}.tar.gz"
      expect(chef_run).to create_remote_file(cache_file)
      expect(chef_run.remote_file(cache_file)).to notify('bash[install ag]').to(:run)
      # NOTE: the default action on bash[install ag] is :nothing;
      #       hence chefspec will not run it, and we spec as such
      expect(chef_run).not_to run_bash('install ag')
    end
  end
end
