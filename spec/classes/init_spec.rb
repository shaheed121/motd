require 'spec_helper'

describe 'motd', type: :class do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('motd') }

      context 'with default values for all parameters' do
        it do
          is_expected.to contain_concat(
            'motd'
          ).with(
            ensure: 'present',
            path:  '/etc/motd',
            owner: 'root',
            group: 'root',
            mode:  '0644'
          )
        end
        it do
          is_expected.to contain_concat__fragment(
            'motd/motd_header'
          ).with(
            target:  'motd',
            order:   '10',
            # rubocop:disable Metrics/LineLength
            content: /-------------------------------------------------\nCustom section starts below:/
          )
        end
        it do
          is_expected.to contain_concat__fragment(
            'motd/motd_footer'
          ).with(
            target:  'motd',
            order:   '90',
            content:
              "\n-------------------------------------------------\n" \
              "   *End of MOTD file*\n" \
              "-------------------------------------------------\n"
          )
        end
      end
    end
  end
end
