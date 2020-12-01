package uk.gov.justice.probation.courtcaseservice.pact;

import au.com.dius.pact.provider.junit5.PactVerificationContext;
import au.com.dius.pact.provider.junit5.PactVerificationInvocationContextProvider;
import au.com.dius.pact.provider.junitsupport.Provider;
import au.com.dius.pact.provider.junitsupport.loader.PactBroker;
import au.com.dius.pact.provider.junitsupport.loader.PactBrokerAuth;
import org.junit.jupiter.api.TestTemplate;
import org.junit.jupiter.api.extension.ExtendWith;

@Provider("offender-detail-provider")
@PactBroker(scheme = "https",
        host = "moj-court-case-service.pactflow.io",
        authentication = @PactBrokerAuth(token = "BePmnJNfr6Ka_6BT2InkBA")
)
public class PactVerificationTest {
  @TestTemplate
  @ExtendWith(PactVerificationInvocationContextProvider.class)
  void pactVerificationTestTemplate(PactVerificationContext context) {
    context.verifyInteraction();
  }
}