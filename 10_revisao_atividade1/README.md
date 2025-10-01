
* Modelagem Conceitual: ER

* Modelagem Lógica: Modelo Relacional

### 🎧 Enunciado Modernizado — Sistema de Streaming de Música

Queremos modelar um sistema de gerenciamento de um **serviço de streaming de música**, semelhante ao Spotify.

* Um **artista** é identificado por um id e possui um nome.
* Uma **música** possui um id, um título e uma duração.
* Uma **gravadora (ou selo musical)** é identificada por um id e possui nome, endereço, telefone, contato e site.
* Um **álbum** possui um id, título, preço (ou tipo de licença) e data de lançamento.
* Um **usuário** é identificado por um id e possui nome, email e tipo de assinatura (Free ou Premium).
* Uma **playlist** possui um id, nome e data de criação.

Além disso:

* Um artista pode compor várias músicas e uma música pode ter vários artistas; músicas também podem existir sem artistas (ex.: músicas de domínio público).
* Uma música pode fazer parte de vários álbuns e um álbum pode conter várias músicas. Deve ser registrado o **número da faixa** da música dentro de cada álbum.
* Uma gravadora pode lançar vários álbuns, mas um álbum pertence exclusivamente a uma única gravadora.
* Para cada álbum, é possível recomendar outro álbum já cadastrado no sistema (autorrelacionamento 1:1 opcional).
* Um usuário pode criar várias playlists, mas cada playlist pertence a apenas um usuário.
* Uma playlist pode conter várias músicas, e cada música pode estar em várias playlists.


<br><br>[Baixar todo o material da aula](https://download-directory.github.io/?url=http://github.com/IgorAvilaPereira/pmbd2025_2sem/tree/main/10_revisao_atividade1) <br><br>
&nbsp;
