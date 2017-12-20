SimpleForm.setup do |config|
  config.wrappers :ranged_datetime, class: :input, error_class: :field_with_errors do |b|
    b.use :html5
    b.use :placeholder
    b.optional :readonly

    ## Inputs
    b.use :label
    b.use :input, class: 'form-control'
    b.use :hint,  wrap_with: { tag: :span, class: :hint }
    b.use :error, wrap_with: { tag: :span, class: :error }
  end
end
