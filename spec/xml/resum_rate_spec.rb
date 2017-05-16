require 'spec_helper'
require 'xml_examples'
require 'xml/plugin_examples'
require 'sslyze/xml/resum_rate'

describe SSLyze::XML::ResumRate do
  include_examples "XML specs"
  include_examples "Plugin element"

  subject { described_class.new(xml.at('/document/results/target/resum_rate')) }

  describe "#session_resumption_with_session_ids" do
    context "when the <sessionResumptionWithSessionIDs/> XML element is present" do
      subject do
        described_class.new(xml.at('/document/results/target/resum[sessionResumptionWithSessionIDs]'))
      end

      it do
        expect(subject.session_resumption_with_session_ids).to \
          be_kind_of(described_class::SessionResumptionWithSessionIDs)
      end
    end

    context "when the <sessionResumptionWithSessionIDs/> XML element is omitted" do
      pending "need an example with no <sessionResumptionWithSessionIDs/>"
    end
  end

  describe "#session_resumption_with_session_ids?" do
    context "when the <sessionResumptionWithSessionIDs/> XML element is present" do
      subject do
        described_class.new(xml.at('/document/results/target/resum[sessionResumptionWithSessionIDs]'))
      end

      it { expect(subject.session_resumption_with_session_ids?).to be true }
    end

    context "when the <sessionResumptionWithSessionIDs/> XML element is omitted" do
      pending "need an example with no <sessionResumptionWithSessionIDs/>"
    end
  end
end
