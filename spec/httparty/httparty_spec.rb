describe "HTTParty" do
  it 'content-type' do
    stub_request(:get, 'https://jsonplaceholder.typicode.com/posts/2').
    to_return(status: 200, body:"", headers: {'content-type': 'application/json'})
    # stub desabilita a conexão com a internet nos testes, então precisa dessa linha acima pra criar o stub

    response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/2')
    content_type = response.headers['content-type'] 
    expect(content_type).to match(/application\/json/) 
  end
end
