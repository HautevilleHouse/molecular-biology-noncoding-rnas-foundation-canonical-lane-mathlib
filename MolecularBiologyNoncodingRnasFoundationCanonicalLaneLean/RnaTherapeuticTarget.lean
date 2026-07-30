import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean

structure RnaTherapeuticTargetPackage where
  diseaseAssociation : Prop
  targetValidation : Prop
  drugDevelopment : Prop
  clinicalTrial : Prop
  regulatoryApproval : Prop

structure RnaTherapeuticTargetEvidence (T : RnaTherapeuticTargetPackage) where
  diseaseAssociationClosed : T.diseaseAssociation
  targetValidationClosed : T.targetValidation
  drugDevelopmentClosed : T.drugDevelopment
  clinicalTrialClosed : T.clinicalTrial
  regulatoryApprovalClosed : T.regulatoryApproval

def RnaTherapeuticTargetClosed (T : RnaTherapeuticTargetPackage) : Prop :=
  T.diseaseAssociation ∧ T.targetValidation ∧
  T.drugDevelopment ∧ T.clinicalTrial ∧ T.regulatoryApproval

theorem rna_therapeutic_target_closed_from_evidence
    (T : RnaTherapeuticTargetPackage) (E : RnaTherapeuticTargetEvidence T) :
    RnaTherapeuticTargetClosed T := by
  exact And.intro E.diseaseAssociationClosed
    (And.intro E.targetValidationClosed
      (And.intro E.drugDevelopmentClosed
        (And.intro E.clinicalTrialClosed E.regulatoryApprovalClosed)))

end MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean
end HautevilleHouse