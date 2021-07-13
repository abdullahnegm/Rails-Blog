


RSpec.shared_examples "index examples" do   
    it { expect(subject).to respond_with(:ok) }  
    it { expect(subject).to render_template(:index) }
end