#
# Cookbook:: centroid_oracle_database
# Spec:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'centroid_weblogic::default' do
  let(:chef_run) do
    # for a complete list of available platforms and versions see:
    # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
    runner = ChefSpec::ServerRunner.new(platform: 'oracle', version: '7.4')
    runner.converge(described_recipe)
  end
end
