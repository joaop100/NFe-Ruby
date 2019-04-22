require 'uri'
require 'net/http'

url = URI("https://webmaniabr.com/api/1/nfe/emissao/")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Post.new(url)
request["cache-control"] = 'no-cache'
request["content-type"] = 'application/json'
request["x-consumer-key"] = 'SEU_CONSUMER_KEY'
request["x-consumer-secret"] = 'SEU_CONSUMER_SECRET'
request["x-access-token"] = 'SEU_ACCESS_TOKEN'
request["x-access-token-secret"] = 'SEU_ACCESS_TOKEN_SECRET'

request.body = "{\n\t\"ID\": 1137,\n\t\"url_notificacao\": \"https://webmaniabr.com/retorno.php\",\n\t\"operacao\": 1,\n\t\"natureza_operacao\": \"Venda de produção do estabelecimento\",\n\t\"modelo\": 1,\n\t\"finalidade\": 1,\n\t\"ambiente\": 2,\n\t\"cliente\": {\n\t\t\"cpf\": \"000.000.000-00\",\n\t\t\"nome_completo\": \"Miguel Pereira da Silva\",\n\t\t\"endereco\": \"Av. Anita Garibaldi\",\n\t\t\"complemento\": \"Sala 809 Royal\",\n\t\t\"numero\": 850,\n\t\t\"bairro\": \"Ahú\",\n\t\t\"cidade\": \"Curitiba\",\n\t\t\"uf\": \"PR\",\n\t\t\"cep\": \"80540-180\",\n\t\t\"telefone\": \"(41) 4063-9102\",\n\t\t\"email\": \"suporte@webmaniabr.com\"\n\t},\n\t\"produtos\": [{\n\t\t\"nome\": \"Camisetas Night Run\",\n\t\t\"codigo\": \"camiseta-night-run\",\n\t\t\"gtin\": \"0789602015376\",\n\t\t\"ncm\": \"6109.10.00\",\n\t\t\"cest\": \"28.038.00\",\n\t\t\"cnpj_produtor\": \"11.290.027/0001-82\",\n\t\t\"quantidade\": 3,\n\t\t\"unidade\": \"UN\",\n\t\t\"peso\": \"0.800\",\n\t\t\"origem\": 0,\n\t\t\"subtotal\": \"44.90\",\n\t\t\"total\": \"134.70\",\n\t\t\"classe_imposto\": \"REF2892\"\n\t}, {\n\t\t\"nome\": \"Camisetas 10 Milhas\",\n\t\t\"codigo\": \"camisetas-10-milhas\",\n\t\t\"gtin\": \"0789602015376\",\n\t\t\"ncm\": \"6109.10.00\",\n\t\t\"cest\": \"28.038.00\",\n\t\t\"cnpj_produtor\": \"11.290.027/0001-82\",\n\t\t\"quantidade\": \"1\",\n\t\t\"unidade\": \"UN\",\n\t\t\"peso\": \"0.200\",\n\t\t\"origem\": 0,\n\t\t\"subtotal\": \"29.90\",\n\t\t\"total\": \"29.90\",\n\t\t\"classe_imposto\": \"REF2892\"\n\t}],\n\t\"pedido\": {\n\t\t\"pagamento\": 0,\n\t\t\"presenca\": 2,\n\t\t\"modalidade_frete\": 0,\n\t\t\"frete\": \"12.56\",\n\t\t\"desconto\": \"10.00\",\n\t\t\"total\": \"174.60\"\n\t},\n\t\"transporte\": {\n\t\t\"cnpj\": \"11.290.027/0001-82\",\n\t\t\"razao_social\": \"Transportes LTDA\",\n\t\t\"ie\": \"123.456.789.123\",\n\t\t\"endereco\": \"Av. Anita Garibaldi\",\n\t\t\"uf\": \"PR\",\n\t\t\"cidade\": \"Curitiba\",\n\t\t\"cep\": \"80540-180\"\n\t}\n}"

response = http.request(request)
puts response.read_body