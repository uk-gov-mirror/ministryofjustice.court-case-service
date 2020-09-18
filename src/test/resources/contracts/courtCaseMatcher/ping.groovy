package courtCaseMatcher

import org.springframework.cloud.contract.spec.Contract

Contract.make {
    request {
        method 'GET'
        url '/ping'
    }
    response {
        status 200
        body 'pong'
    }
}