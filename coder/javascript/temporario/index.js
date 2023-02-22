const { Pool } = require('pg')
const pool = new Pool({
  user: 'postgres',
  host: 'postgresql-dev.unisuam.edu.br',
  database: 'sagadev',
  password: '',
  port: 5432,
})
let q ="SELECT * FROM gra.alunos  where label='16101875'"//16101875

q= "SELECT * FROM gra.sp_retorna_historico('21102217')"

q = "SELECT * FROM gra.sp_retorna_historico_disciplinas(10);"
pool.query(q, (err, res) => {
 // console.log(err, res.rows) 
if(res){
    //console.table(res.rows)
let temp = res.rows
let periodos = [] //crio um array vazio
for (var i = 0; i < temp.length; i++){
   if (!periodos.includes(temp[i].periodo))//verifico se não existe no array o valor vindo do resultado
      periodos.push(temp[i].periodo)
}
console.table(periodos)//obtenho a lista de todos os período existentes
objeto_organizado_por_periodo = {}
periodos.forEach(e => objeto_organizado_por_periodo[e] = temp.filter(disciplinas => disciplinas.periodo == e))
console.table(objeto_organizado_por_periodo)
}

  pool.end() 
})