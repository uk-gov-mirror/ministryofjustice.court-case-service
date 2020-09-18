package uk.gov.justice.probation.courtcaseservice;

import io.restassured.module.mockmvc.RestAssuredMockMvc;
import org.junit.Before;
import uk.gov.justice.probation.courtcaseservice.controller.PingEndpoint;

abstract class CourtCaseMatcherBase {
    private PingEndpoint pingController = new PingEndpoint();

    @Before
    public void setup() {
        RestAssuredMockMvc.standaloneSetup(pingController);
    }
}
