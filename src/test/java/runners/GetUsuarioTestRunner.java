package runners;

import com.intuit.karate.junit5.Karate;

public class GetUsuarioTestRunner {

    @Karate.Test
    public Karate runGetUsuario(){
        return Karate.run("classpath:features/usuarios/GetUsuario.feature");
    }
}
