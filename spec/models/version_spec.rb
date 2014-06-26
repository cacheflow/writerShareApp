require 'spec_helper'

describe Version do
    it { should validate_presence_of(:title) }
    it { should belong_to(:user) }
  
end
