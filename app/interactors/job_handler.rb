class JobHandler
  def run(data)
    raise NotImplementedError, "Subclasses must implement the run method"
  end
end
