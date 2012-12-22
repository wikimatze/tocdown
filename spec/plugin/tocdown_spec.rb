require 'spec_helper'

describe "Tocdown" do
  let(:filename) { 'test.markdown' }
  let(:vim) { @vim }

  specify "toplevel headings" do
    set_file_contents <<-EOF
      ## Description ##
      one
      ## Screencast ##
      two
    EOF

    tocdown_toggle

    tocdown_window_contents.should eq normalize_string(<<-EOF)
      Description
      Screencast
    EOF
  end

  specify "nested headings" do
    set_file_contents <<-EOF
      ## Description ##
      one
      ### Subdescription ###
      two
      ## Screencast ##
      three
      ### Level 2 ###
      four
      #### Level 3 ####
      five
    EOF

    tocdown_toggle

    tocdown_window_contents.should eq normalize_string(<<-EOF)
      Description
        Subdescription
      Screencast
        Level 2
          Level 3
    EOF
  end

  specify "no gaps" do
    set_file_contents <<-EOF
      ## Description ##
      ## Screencast ##
    EOF

    tocdown_toggle

    tocdown_window_contents.should eq normalize_string(<<-EOF)
      Description
      Screencast
    EOF
  end

  specify "no closing #s" do
    set_file_contents <<-EOF
      ## Description
      ## Screencast ##
    EOF

    tocdown_toggle

    tocdown_window_contents.should eq normalize_string(<<-EOF)
      Description
      Screencast
    EOF
  end
end
