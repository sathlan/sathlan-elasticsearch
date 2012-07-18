require 'spec_helper'

describe 'elasticsearch' do
  it {should include_class('elasticsearch::params')}
  it {should include_class('elasticsearch::install')}

  it { should contain_exec('get_deb').with(
                                       'command' => /curl/,
                                       'path'    => /bin/
                                      )}
  it { should contain_exec('install_deb')}
end
