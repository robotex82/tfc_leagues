class CascadeSelectInput < Formtastic::Inputs::SelectInput
  def to_html
    # super
    input_wrapping do
      label_html <<
      (options[:group_by] ? grouped_select_html : select_html) << loader_div.html_safe
    end
  end

  protected

  def loader_div
%Q[
<span class="loading" id="#{dom_id}_loading" style="display: none;">
  <span class="bowlG">
    <span class="bowl_ringG">
      <span class="ball_holderG">
        <span class="ballG">
        </span>
      </span>
    </span>
  </span>
</span>
]
  end

  def input_options
    super.merge :include_blank => true
  end

  def input_html_options
    extra_input_html_options.merge(super)
  end

  def extra_input_html_options
    {
      :"data-select-cascade" => true,
      :"data-select-cascade-next-item" => options[:next],
      :"data-select-cascade-url" => options[:url]
    }


  end

  def next_select
    options[:next]
  end

  def has_next_select?
    options[:next].present?
  end
end
