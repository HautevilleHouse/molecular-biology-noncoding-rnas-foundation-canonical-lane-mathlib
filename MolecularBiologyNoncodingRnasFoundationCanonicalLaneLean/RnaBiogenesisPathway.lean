import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean

structure RnaBiogenesisPathwayPackage where
  transcriptionalRegulation : Prop
  processingMaturation : Prop
  exportToCytoplasm : Prop
  regulatoryMechanism : Prop
  degradationTurnover : Prop

structure RnaBiogenesisPathwayEvidence (P : RnaBiogenesisPathwayPackage) where
  transcriptionalRegulationClosed : P.transcriptionalRegulation
  processingMaturationClosed : P.processingMaturation
  exportToCytoplasmClosed : P.exportToCytoplasm
  regulatoryMechanismClosed : P.regulatoryMechanism
  degradationTurnoverClosed : P.degradationTurnover

def RnaBiogenesisPathwayClosed (P : RnaBiogenesisPathwayPackage) : Prop :=
  P.transcriptionalRegulation ∧ P.processingMaturation ∧
  P.exportToCytoplasm ∧ P.regulatoryMechanism ∧ P.degradationTurnover

theorem rna_biogenesis_pathway_closed_from_evidence
    (P : RnaBiogenesisPathwayPackage) (E : RnaBiogenesisPathwayEvidence P) :
    RnaBiogenesisPathwayClosed P := by
  exact And.intro E.transcriptionalRegulationClosed
    (And.intro E.processingMaturationClosed
      (And.intro E.exportToCytoplasmClosed
        (And.intro E.regulatoryMechanismClosed E.degradationTurnoverClosed)))

end MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean
end HautevilleHouse