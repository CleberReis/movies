//
//  MovieService.swift
//  movies
//
//  Created by Cleber Reis on 18/04/20.
//  Copyright © 2020 Cleber Reis. All rights reserved.
//

import Foundation

class MovieService {
    
    static let shared = MovieService()
    
    func searchMovies() -> [Movie] {
        
        var movies = [Movie]()
        
        movies.append(Movie(
            id: 1,
            title: "Rambo: Até o Fim",
            thumbUrl: "cartaz-1",
            thumbDetailUrl: "cartaz-destaque-1",
            description: """
          Após décadas lutando contra seus inimigos, John Rambo (Sylvester Stallone) enfim encontrou a paz em um rancho na fronteira entre os Estados Unidos e o México.
          
          Lá ele ajuda Maria Beltran (Adriana Barraza) a criar a neta Gabrielle (Yvette Monreal), que o trata com imenso carinho.
          
          Decidida a encontrar o pai, que a abandonou ainda criança, ela conta com a ajuda de uma amiga que agora vive no México para localizá-lo.
          """
        ))
        
        movies.append(Movie(
            id: 2,
            title: "Coringa",
            thumbUrl: "cartaz-2",
            thumbDetailUrl: "cartaz-destaque-2",
            description: """
          O comediante falido Arthur Fleck encontra violentos bandidos pelas ruas de Gotham City.

          Desconsiderado pela sociedade, Fleck começa a ficar louco e se transforma no criminoso conhecido como Coringa.
          """
        ))
        
        movies.append(Movie(
            id: 3,
            title: "Malévola - Dona do Mal",
            thumbUrl: "cartaz-3",
            thumbDetailUrl: "cartaz-destaque-3",
            description: """
          Em "Malévola: Dona do Mal", uma sequência do sucesso de bilheteria global de 2014, Malévola e sua afilhada Aurora começam a questionar os complexos laços familiares que as prendem à medida que são puxadas em direções diferentes por casamentos, aliados inesperados e novas forças sombrias em jogo.
          """
        ))
        
        movies.append(Movie(
            id: 4,
            title: "Zumbilândia - Atire Duas Vezes",
            thumbUrl: "cartaz-4",
            thumbDetailUrl: "cartaz-destaque-4",
            description: """
          Uma década depois de Zumbilândia se transformar em um hit cult, o elenco original (Woody Harrelson, Jesse Eisenberg, Abigail Breslin e Emma Stone) se reúne ao diretor Ruben Fleischer (Venom) e roteiristas Rhett Reese & Paul Wernick (Deadpool) para Zumbilândia: Atire duas vezes.
          """
        ))
        
        movies.append(Movie(
            id: 5,
            title: "Angry Birds 2 - O Movie",
            thumbUrl: "cartaz-5",
            thumbDetailUrl: "cartaz-destaque-5",
            description: """
          Os raivosos pássaros que não voam e os engenhosos porquinhos verdes levam sua briga para o próximo nível em Angry Birds 2 – O Movie!
          """
        ))
        
        movies.append(Movie(
            id: 6,
            title: "Ela Disse, Ele Disse",
            thumbUrl: "cartaz-6",
            thumbDetailUrl: "cartaz-destaque-6",
            description: """
          Ela Disse, Ele Disse acompanha a rotina dos adolescentes Rosa e Leo, sobre os seus próprios pontos de vista.

          Aos 14 anos, eles agora precisam se adaptar a uma nova realidade e fazer de tudo para sobreviver ao primeiro ano num novo colégio.
          """
        ))
        
        movies.append(Movie(
            id: 7,
            title: "Star Wars: A Ascensão Skywalker",
            thumbUrl: "cartaz-7",
            thumbDetailUrl: "cartaz-destaque-7",
            description: """
          Lucasfilm e o diretor J.J. Abrams juntam forças mais uma vez para levar os espectadores a uma jornada épica em uma galáxia muito, muito distante em Star Wars: A Ascensão Skywalker, a fascinante conclusão da saga Skywalker, na qual novas lendas nascerão e a batalha final pela liberdade ainda está por vir
          """
        ))
        
        movies.append(Movie(
            id: 8,
            title: "Projeto Gemini",
            thumbUrl: "cartaz-8",
            thumbDetailUrl: "cartaz-destaque-8",
            description: """
          PROJETO GEMINI” (GEMINI MAN) é um inovador thriller de ação estrelado por Will Smith como Henry Brogan, um assassino de elite, que é subitamente alvo e perseguido por um misterioso jovem agente que aparentemente pode prever cada movimento seu.
          """
        ))
        
        return movies
        
    }
}
