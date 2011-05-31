class OperationsController < ApplicationController
before_filter:authorize
  def admission
  @title="Admission"
  end

  def treament
   @title="Treatment"
  end

  def referral
   @title="Referral"
  end

  def discharge
   @title="Discharge"
  end

  def reports
   @title="Reports"
  end

end
