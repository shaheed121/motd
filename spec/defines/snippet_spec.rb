require 'spec_helper'

describe 'motd::snippet', type: :define do
  let(:title) { 'test_snippet' }
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      context 'snippet with custom values' do
        let(:params) do
          {
            content: 'This is testing.',
            order:   85
          }
        end
        it do
          is_expected.to contain_concat__fragment(
            '/etc/motd/85/test_snippet'
          ).with(
            target:  '/etc/motd',
            order:   '85',
            content: 'This is testing.'
          )
        end
      end

      context 'snippet with just the content' do
        let(:params) do
          {
            content: 'This is testing.'
          }
        end
        it do
          is_expected.to contain_concat__fragment(
            '/etc/motd/50/test_snippet'
          ).with(
            target:  '/etc/motd',
            order:   '50',
            content: 'This is testing.'
          )
        end
      end

      context 'snippet with no content' do
        it { is_expected.to raise_error(Puppet::Error) }
      end
    end
  end
end
