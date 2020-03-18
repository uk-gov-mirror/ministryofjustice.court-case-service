package uk.gov.justice.probation.courtcaseservice.service.model;

import lombok.Builder;
import lombok.Getter;

import java.time.LocalDate;
import java.util.List;

@Getter
@Builder
public class Conviction {
    private String convictionId;
    private Boolean active;
    private LocalDate convictionDate;
    private List<Offence> offences;
    private Sentence sentence;
    private LocalDate endDate;
}