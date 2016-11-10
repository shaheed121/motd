require 'spec_helper'

describe 'motd', :type=> 'class' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts)  do
        facts
      end

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('motd') }

      context 'with default values for all parameters' do
        it { is_expected.to contain_concat('/etc/motd').with(
          :path   => '/etc/motd',
          :owner  => 'root',
          :group  => 'root',
          :mode   => '0644',
        ) }
        it { is_expected.to contain_concat__fragment('motd_header').with(
          :target  => '/etc/motd',
          :order   => '10',
          :content => /-------------------------------------------------\nCustom section starts below:/,
        ) }
        it { is_expected.to contain_concat__fragment('motd_footer').with(
          :target  => '/etc/motd',
          :order   => '90',
          :content =>
             "\n-------------------------------------------------\n" \
             "   *End of MOTD file*\n" \
             "-------------------------------------------------\n",
        ) }
      end

    end
  end
end
