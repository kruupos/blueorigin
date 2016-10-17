RSpec.describe "home/index.html.erb", type: :view do
  it 'displays the view correctly' do
    assign(:user, build(:user, name: 'donald'))
    assign(:schedule, build(:schedule))
    assign(:teleporter, build(:teleporter))

    render

    expect(view).to render_template("index")
  end
end
