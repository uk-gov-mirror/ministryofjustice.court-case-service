package uk.gov.justice.probation.courtcaseservice.jpa.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import uk.gov.justice.probation.courtcaseservice.jpa.entity.GroupedOffenderMatchesEntity;

import java.util.Optional;

@Repository
public interface GroupedOffenderMatchRepository extends CrudRepository<GroupedOffenderMatchesEntity, Long> {
    Optional<GroupedOffenderMatchesEntity> findByCourtCodeAndCaseNo(String courtCode, String caseNo);
}
