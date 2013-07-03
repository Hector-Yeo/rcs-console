package it.ht.rcs.console.entities.view.map
{
  import flash.display.Sprite;
  import flash.filters.GlowFilter;
  
  import it.ht.rcs.console.entities.model.Entity;
  
  
  public class CustomMarker extends Sprite
  {
    
    [Embed(source='/img/NEW/star_50.png')]
    private var entityIcon:Class;
    
    [Embed(source='/img/NEW/mapMarker_people.png')]
    private var entityPeopleIcon:Class;
    
    [Embed(source='/img/NEW/mapMarker_location.png')]
    private var entityLocationIcon:Class;
    
    [Embed(source='/img/NEW/mapMarker_target.png')]
    private var entityTargetIcon:Class;
    
    public var data:Entity;
    private var _selected:Boolean;
    private var _glow:GlowFilter;
    public var entity:Entity;
    
    public function CustomMarker(entity:Entity)
    {
      this.entity=entity;
      _glow=new GlowFilter(0x00CCFF,1,10,10,2,1)
      data=entity;
      var icon:Sprite=new Sprite();
      icon.x=-12;
      icon.y=-24;
      if(entity.type =="position")
        icon.addChild(new entityLocationIcon());
      if(entity.type =="target")
        icon.addChild(new entityTargetIcon());
      addChild(icon); 
    }
    
    public function set selected(value:Boolean):void
    {
      _selected=value;
      if(selected)
      {
        //border.setStyle('backgroundAlpha', 0.2);
        //border.setStyle('borderAlpha', 1);
        this.filters=[_glow]
      }
      else
      {
        //border.setStyle('backgroundAlpha', 0);
        //border.setStyle('borderAlpha', 0);
        this.filters=null
      }
    }
    
    public function get selected():Boolean
    {
      return _selected
    }
  }
}