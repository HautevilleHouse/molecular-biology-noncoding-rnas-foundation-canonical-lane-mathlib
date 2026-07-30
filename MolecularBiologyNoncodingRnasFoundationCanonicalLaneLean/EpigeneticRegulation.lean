import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean

structure EpigeneticRegulation where
  chromatinRemodeling : Prop
  histoneModification : Prop
  dnaMethylation : Prop
  ncrnaRecruitment : Prop
  geneSilencing : Prop

structure EpigeneticRegulationEvidence (E : EpigeneticRegulation) where
  chromatinRemodelingClosed : E.chromatinRemodeling
  histoneModificationClosed : E.histoneModification
  dnaMethylationClosed : E.dnaMethylation
  ncrnaRecruitmentClosed : E.ncrnaRecruitment
  geneSilencingClosed : E.geneSilencing

def EpigeneticRegulationClosed (E : EpigeneticRegulation) : Prop :=
  E.chromatinRemodeling ∧ E.histoneModification ∧ E.dnaMethylation ∧ E.ncrnaRecruitment ∧ E.geneSilencing

theorem epigenetic_regulation_closed_from_evidence
    (E : EpigeneticRegulation) (Ev : EpigeneticRegulationEvidence E) :
    EpigeneticRegulationClosed E := by
  exact And.intro Ev.chromatinRemodelingClosed
    (And.intro Ev.histoneModificationClosed
      (And.intro Ev.dnaMethylationClosed
        (And.intro Ev.ncrnaRecruitmentClosed Ev.geneSilencingClosed)))

end MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean
end HautevilleHouse