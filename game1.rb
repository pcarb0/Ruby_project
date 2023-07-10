class Jogador
  @@vida = 500
  @@mana = 100
  def escolher
    print "(1 - atacar)(2 - curar)"
    escolha = gets.chomp
    if escolha == '1'
       atacar
    elsif escolha == '2'
      curar
    else
      puts "Escolha inválida, perdeu a vez"
    end
  end
  def self.vida
    @@vida
  end
  def self.mana
    @@mana
  end
  def atacar
    dano = rand(10..15)
    inimigo_selecionado = rand(1..$n_inimigos)
    puts "Você causou #{dano} ao inimigo #{$array_de_inimigos[inimigo_selecionado-1]}"
    $array_paralela[inimigo_selecionado-1] -= dano
    $array_paralela.each do |elemento|
      if elemento < 1
        puts "o inimigo #{$array_de_inimigos[inimigo_selecionado-1]} morreu"
         $array_paralela.delete_at(inimigo_selecionado-1)
         $array_de_inimigos.delete_at(inimigo_selecionado-1)
         $n_inimigos -= 1
      end
    end
  end
  def curar
    if @@mana < 10
      return puts "sem mana para curar-se"
    else
      puts "você se curou em 10 de vida"
      @@vida += rand(10..15)
      @@mana -= 10
    end
  end
  def atacado
    for a in 1..$array_de_inimigos.count do
      damage = rand(0..3)
      puts "o inimigo #{$array_de_inimigos[a-1]} {vida = #{$array_paralela[a-1]}}causou #{damage} a você"
      @@vida -= damage
    end
  end
end
def main
  $array_de_inimigos = []
  $array_paralela = []
  print "Digite com quantos inimigos deseja batalhar: "
  $n_inimigos = gets.to_i
  for a in 1..$n_inimigos do
    $array_de_inimigos.push(a)
    $array_paralela.push(50)
  end
  player = Jogador.new
  loop do
    puts "MANA:#{Jogador.mana}"
    puts "VIDA:#{Jogador.vida}"
    player.escolher
    if $array_de_inimigos.count < 1
      puts "Você derrotou todos os inimigos parabéns"
      break
    end
    player.atacado
    if Jogador.vida < 1
      puts "Você morreu"
      break
    end
  end
end
main
