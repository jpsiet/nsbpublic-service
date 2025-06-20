    import com.intuit.karate.junit5.Karate;

    class StudentApiTest {

        @Karate.Test
        Karate testAll() {

            return Karate.run("gherkin/students").relativeTo(getClass());
        }
    }