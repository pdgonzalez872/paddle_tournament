describe "root" do
  it "displays the root when we visit root_path" do
    visit root_path
    expect(page).to have_content "Tournaments"
  end
end
