require 'spec_helper'

describe Domain do
  it { should have_many(:links) }
end
