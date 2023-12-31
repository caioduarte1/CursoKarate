package runners;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

public class ExecucaoGeralTestRunner {

    @Test
    public void runExecucaoGeralParalela(){
        Runner.Builder builder = new Runner.Builder();
        builder.path("classpath:features");
        builder.tags("@Regressivo,@smoke,@diferente");
        Results results = builder.parallel(100);
        Assertions.assertEquals(0,results.getFailCount());
    }
}