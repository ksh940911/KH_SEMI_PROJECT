package order.model.vo;

import java.util.List;

import javax.annotation.Generated;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

@Generated("jsonschema2pojo")
public class Result {

	@SerializedName("selectedMenu")
	@Expose
	private List<SelectedMenu> selectedMenu = null;

	public List<SelectedMenu> getSelectedMenu() {
		return selectedMenu;
	}

	public void setSelectedMenu(List<SelectedMenu> selectedMenu) {
		this.selectedMenu = selectedMenu;
	}

}