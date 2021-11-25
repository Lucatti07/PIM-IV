public class Cls_Sql
    {
        #region atributos
        // atributos //
        public string string_conexao = @"Data Source=DESKTOP-IJ6I486;Initial Catalog=db_Transilvania;Integrated Security=True";
        public string query_string = "";
        #endregion
        #region metodos
        // metodos //
        public SqlDataReader sql_data_reader()
        {
            SqlConnection conexao = new SqlConnection();
            conexao.ConnectionString = this.string_conexao;
            conexao.Open();

            SqlCommand comando = new SqlCommand();
            comando.CommandText = query_string;
            comando.Connection = conexao;

            SqlDataReader reader = comando.ExecuteReader();

            return reader;
        }
    
        public DataTable sql_data_adapter()
        {
            DataTable dtb = new DataTable();

            SqlConnection conexao = new SqlConnection();
            conexao.ConnectionString = this.string_conexao;
            try
            {
                conexao.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(query_string, conexao);

                adapter.Fill(dtb);

                conexao.Dispose();
                adapter.Dispose();
            }
            catch
            {
            }
            return dtb;
        }

        public bool execute_non_query()
        {
            try
            {
                SqlConnection conexao = new SqlConnection();
                conexao.ConnectionString = this.string_conexao;
                conexao.Open();

                SqlCommand comando = new SqlCommand();
                comando.CommandText = query_string;
                comando.Connection = conexao;
                comando.ExecuteNonQuery();

                conexao.Dispose();
                comando.Dispose();
                return true;
            }
            catch
            {
                return false;
            }
        }
        #endregion
    }