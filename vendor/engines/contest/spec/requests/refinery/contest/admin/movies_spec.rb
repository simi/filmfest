# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Contest" do
    describe "Admin" do
      describe "movies" do
        login_refinery_user

        describe "movies list" do
          before(:each) do
            FactoryGirl.create(:movie, :name => "UniqueTitleOne")
            FactoryGirl.create(:movie, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.contest_admin_movies_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before(:each) do
            visit refinery.contest_admin_movies_path

            click_link "Add New Movie"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Contest::Movie.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::Contest::Movie.count.should == 0
            end
          end

          context "duplicate" do
            before(:each) { FactoryGirl.create(:movie, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.contest_admin_movies_path

              click_link "Add New Movie"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Contest::Movie.count.should == 1
            end
          end

        end

        describe "edit" do
          before(:each) { FactoryGirl.create(:movie, :name => "A name") }

          it "should succeed" do
            visit refinery.contest_admin_movies_path

            within ".actions" do
              click_link "Edit this movie"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:movie, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.contest_admin_movies_path

            click_link "Remove this movie forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Contest::Movie.count.should == 0
          end
        end

      end
    end
  end
end
